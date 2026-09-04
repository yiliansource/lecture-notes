<script setup lang="ts">
import { GraduationCap, Pencil } from "@lucide/vue";
import { format } from "date-fns";
import type { LectureMetadata } from "../generated/lectures";

defineProps<{
	lecture: LectureMetadata;
}>();
</script>

<template>
    <div class="py-4 select-none border-b border-gray-200">
        <div class="flex flex-col">
            <div class="mb-2 flex flex-row gap-3">
                <span class="font-semibold">
                    <a class="hover:underline" :href="`/documents/${lecture.id}.pdf`" target="_blank">
                        {{ lecture.title }}
                    </a>
                </span>
                <span v-if="lecture.semester !== null"
                    class="inline-flex items-center px-2 py-1 text-xs font-semibold text-blue-700 bg-blue-100 rounded-xl">
                    {{ lecture.semester }}
                </span>
            </div>
            <div class="flex flex-col lg:flex-row gap-1 lg:gap-5 text-neutral-500 text-sm">
                <div v-if="lecture.lecturer !== null" class="flex flex-row items-center gap-1">
                    <span class="text-base">
                        <GraduationCap :size="16" />
                    </span>
                    <span>{{ lecture.lecturer }}</span>
                </div>
                <div class="flex flex-row items-center gap-1">
                    <span class="text-sm">
                        <Pencil :size="14" />
                    </span>
                    <span>
                        {{ format(lecture.lastChanged, "eeee, do MMMM yyyy, HH:mm", {}) }}
                    </span>
                </div>
            </div>
        </div>
    </div>
</template>
