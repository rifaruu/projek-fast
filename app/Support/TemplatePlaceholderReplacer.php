<?php

namespace App\Support;

use Illuminate\Support\Collection;
use Illuminate\Support\Str;

class TemplatePlaceholderReplacer
{
    /**
     * @param  array<string, mixed>  $placeholderValues
     */
    public static function replace(
        string $content,
        array $placeholderValues,
        bool $convertNewlinesToBreaks = true,
        bool $stripUnknownPlaceholders = true
    ): string {
        foreach ($placeholderValues as $key => $value) {
            if (! is_string($key) || $key === '' || str_starts_with($key, '__')) {
                continue;
            }

            $escapedValue = e(static::stringifyValue($key, $value));

            if ($convertNewlinesToBreaks) {
                $escapedValue = nl2br($escapedValue, false);
            }

            $content = str_replace(
                ['{{' . $key . '}}', '{{ ' . $key . ' }}'],
                $escapedValue,
                $content
            );
        }

        if ($stripUnknownPlaceholders) {
            $content = preg_replace('/{{\s*[\w\.]+\s*}}/', '', $content) ?? $content;
        }

        return static::removeEmptyParagraphs($content);
    }

    public static function stringifyValue(string $key, mixed $value): string
    {
        if (is_array($value)) {
            return static::formatArrayValue($key, $value);
        }

        if ($value instanceof Collection) {
            return static::formatArrayValue($key, $value->all());
        }

        return (string) ($value ?? '');
    }

    /**
     * @param  array<int, mixed>  $items
     */
    protected static function formatArrayValue(string $key, array $items): string
    {
        $normalizedItems = collect($items)
            ->map(static fn (mixed $item): string => trim((string) $item))
            ->filter(static fn (string $item): bool => $item !== '')
            ->values();

        if ($normalizedItems->isEmpty()) {
            return '';
        }

        $isYthList = Str::contains(Str::lower($key), 'yth');

        if ($isYthList && $normalizedItems->count() === 1) {
            return 'Yth. ' . $normalizedItems->first();
        }

        if ($isYthList) {
            return "Yth.\n" . $normalizedItems
                ->values()
                ->map(fn (string $item, int $index): string => ($index + 1) . '. ' . $item)
                ->implode("\n");
        }

        if ($normalizedItems->count() === 1) {
            return $normalizedItems->first();
        }

        return $normalizedItems
            ->values()
            ->map(fn (string $item, int $index): string => ($index + 1) . '. ' . $item)
            ->implode("\n");
    }

    protected static function removeEmptyParagraphs(string $content): string
    {
        return preg_replace('/<p\b[^>]*>\s*(?:<br\s*\/?>|\&nbsp;|\s)*<\/p>/i', '', $content) ?? $content;
    }
}
