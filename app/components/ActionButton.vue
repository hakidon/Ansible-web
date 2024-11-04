<template>
    <button class="btn" :class="buttonClass" @click="$emit('click')">
        <i v-if="icon" :class="icon" class="me-1"></i>
        {{ label }}
    </button>
</template>

<script setup lang="ts">
import { computed } from "vue";

const props = defineProps<{
    label: string;
    variant?: 'primary' | 'secondary' | 'outline-primary';
    icon?: string;
}>();

const buttonClass = computed(() => ({
    'btn-primary': props.variant === 'primary',
    'btn-secondary': props.variant === 'secondary',
    'btn-outline-primary': props.variant === 'outline-primary',
}));
</script>