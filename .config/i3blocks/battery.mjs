#!/usr/bin/env zx

$.verbose = false

const [, stat, percent ] = (/: ([\w\s]+), (\d+)%/).exec(await $`acpi`);

console.log(`${stat} ${percent}%`);
