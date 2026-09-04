<script setup lang="ts">
import LectureItem from "./components/LectureItem.vue";
import { lectures } from "./generated/lectures.ts";
</script>

<template>
    <div class="px-3 flex flex-col mx-auto w-full min-h-screen max-w-4xl">
        <header class="pt-12 lg:pt-16 pb-4 lg:pb-8 select-none">
            <h1 class="mb-2 text-2xl lg:text-4xl font-semibold">Lecture Notes</h1>
            <p class="text-base lg:text-lg flex flex-row items-center gap-2 text-neutral-500">
                <span class="w-7 aspect-square inline-block rounded-full overflow-hidden">
                    <img src="/avatar.png" width={32} height={32} alt="Ian Hornik" draggable="false" class="scale-125" />
                </span>
                <span>Ian Hornik</span>
            </p>
        </header>
        
        <div class="grow flex flex-col">
            <LectureItem v-for="lecture in lectures" :lecture="lecture" :key="lecture.id" />
        </div>

        <footer class="py-3 lg:py-6 flex flex-col select-none text-neutral-500 ">
            <p class="mb-1">A collection of lecture notes.</p>
            <div class="flex flex-row justify-between items-center text-sm text-neutral-400">
                <p>&copy; {{ new Date().getFullYear() }} Ian Hornik</p>
                <p class="opacity-30 hover:opacity-70">
                    <a href="https://github.com/yiliansource/lecture-notes" target="_blank">
                        <img class="size-5" src="/github.svg" />
                    </a>
                </p>
            </div>
        </footer>
    </div>
</template>
