<template>
  <div class="container-fluid p-4">
    <Header title="CONFIGURATION BACKUP" />

    <p class="text-primary">IP Address: {{ ip }}</p>

    <div class="card shadow-sm">
      <div class="card-body">
        <DataTable :columns="columns" :data="backupData" @action="handleAction" />
      </div>
    </div>

    <div class="mt-4 text-center">
      <ActionButton label="Run Backup" variant="primary" icon="bi bi-play-circle" @click="runBackup" />
    </div>
  </div>
</template>

<script setup>
const route = useRoute()
const ip = route.params.ip

const backupData = ref([
  {
    date: '20/10/2024',
    fileName: `${ip}_2024-09-24_16:00:07.txt`,
  },
  {
    date: '21/10/2024',
    fileName: `${ip}_2024-09-25_18:00:07.txt`,
  },
  {
    date: '21/10/2024',
    fileName: `${ip}_2024-09-28_20:00:07.txt`,
  },
  {
    date: '22/10/2024',
    fileName: `${ip}_2024-09-28_11:00:35.txt`,
  },
  {
    date: '25/10/2024',
    fileName: `${ip}_2024-10-25_22:01:00.txt`,
  },
])

const columns = [
  { key: 'date', label: 'Date' },
  { key: 'fileName', label: 'File Name' },
  { key: 'details', label: 'Details', type: 'button' }
]

// If you're using API calls, you might want to use useFetch or useAsyncData
const handleAction = ({ row, key }) => {
  if (key === 'details') {
    // Might use navigateTo() here for Nuxt routing
    console.log('View details', row)
  }
}

const runBackup = async () => {
  try {
    // Example using Nuxt's $fetch (auto-imported)
    // await $fetch(`/api/backup/${ip}`)
    console.log('Running backup...', ip)
  } catch (error) {
    console.error('Backup failed:', error)
  }
}
</script>