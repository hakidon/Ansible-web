<template>
  <div class="container-fluid p-3">
    <Header title="PREVENTIVE MAINTENANCE REPORT" />

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
  { ipAddress: '10.10.0.131', vendor: 'Cisco', hardwareModel: 'Cisco NXOS', hostname: 'NTT_LAB_CORE_1', serialNum: 'ZDO1439Z0A7', uptime: '12 weeks, 12 hours, 56 minutes', PID: 'WS-C3750X-48PF', PID1: 'WS-C3750X-48PF', PID2: 'WS-C3750X-48PF', PID3: 'WS-C3750X-48PF', PID4: 'WS-C3750X-48PF', },
  { ipAddress: '10.10.0.131', vendor: 'Cisco', hardwareModel: 'Cisco NXOS', hostname: 'NTT_LAB_CORE_1', serialNum: 'ZDO1439Z0A7', uptime: '12 weeks, 12 hours, 56 minutes', PID: 'WS-C3750X-48PF', PID1: 'WS-C3750X-48PF', PID2: 'WS-C3750X-48PF', PID3: 'WS-C3750X-48PF', PID4: 'WS-C3750X-48PF', },
  { ipAddress: '10.10.0.131', vendor: 'Cisco', hardwareModel: 'Cisco NXOS', hostname: 'NTT_LAB_CORE_1', serialNum: 'ZDO1439Z0A7', uptime: '12 weeks, 12 hours, 56 minutes', PID: 'WS-C3750X-48PF', PID1: 'WS-C3750X-48PF', PID2: 'WS-C3750X-48PF', PID3: 'WS-C3750X-48PF', PID4: 'WS-C3750X-48PF', },
  { ipAddress: '10.10.0.131', vendor: 'Cisco', hardwareModel: 'Cisco NXOS', hostname: 'NTT_LAB_CORE_1', serialNum: 'ZDO1439Z0A7', uptime: '12 weeks, 12 hours, 56 minutes', PID: 'WS-C3750X-48PF', PID1: 'WS-C3750X-48PF', PID2: 'WS-C3750X-48PF', PID3: 'WS-C3750X-48PF', PID4: 'WS-C3750X-48PF', },
  { ipAddress: '10.10.0.131', vendor: 'Cisco', hardwareModel: 'Cisco NXOS', hostname: 'NTT_LAB_CORE_1', serialNum: 'ZDO1439Z0A7', uptime: '12 weeks, 12 hours, 56 minutes', PID: 'WS-C3750X-48PF', PID1: 'WS-C3750X-48PF', PID2: 'WS-C3750X-48PF', PID3: 'WS-C3750X-48PF', PID4: 'WS-C3750X-48PF', },

])

const columns = [
  { key: 'Details', label: 'Action', type: 'button' },
  { key: 'ipAddress', label: 'IP Address(es)' },
  { key: 'vendor', label: 'Vendor' },
  { key: 'hostname', label: 'Hostname' },
  { key: 'serialNum', label: 'Serial Number' },
  { key: 'uptime', label: 'Uptime' },
  { key: 'PID', label: 'PID' },
  { key: 'PID1', label: 'PID1' },
  { key: 'PID2', label: 'PID2' },
  { key: 'PID3', label: 'PID3' },
  { key: 'PID4', label: 'PID4' },
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

<style scoped>
.custom-card {
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  border: none;
}
</style>