<template>
  <div class="d-flex justify-content-between align-items-center mb-4">
    <div class="d-flex align-items-center gap-3">
      <button class="btn btn-outline-primary" @click="router.back()">
        <i class="bi bi-arrow-left"></i> Back
      </button>
      <h1 class="mb-0">{{ title }}</h1>
    </div>
    <div class="d-flex align-items-center gap-2">
      <span class="text-muted">Date: {{ formattedDate }}</span>
      <button class="btn btn-outline-primary" @click="handleDownload">
        Download <i class="bi bi-download ms-1"></i>
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
const route = useRoute();
const router = useRouter();
const ip = route.params.ip;

const props = defineProps<{
  title: string;
}>();

const formattedDate = computed(() => {
  const today = new Date();
  return today.toLocaleDateString("en-GB");
});

const handleDownload = () => {
  // Implement download logic
  console.log("Downloading...");
};
</script>
