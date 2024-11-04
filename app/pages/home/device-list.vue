<template>
  <div class="container-fluid p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h1 class="mb-0">LIST OF DEVICES</h1>
      <div class="d-flex align-items-center gap-2">
        <span class="text-muted">Date: {{ currentDate }}</span>
      </div>
    </div>

    <div class="card shadow-sm">
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-hover">
            <thead>
              <tr>
                <th>Type of Device</th>
                <th>IP Address(es)</th>
                <th>Last Backup</th>
                <th>Runtime Duration</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="device in devices" :key="device.ip">
                <td>

                  <button class="xclick badge border-0 " :class="getDeviceTypeBadgeClass(device.type)" type="button"
                    :id="`device-${device.ip}`" data-bs-toggle="dropdown" aria-expanded="false">
                    {{ device.type }}
                  </button>
                </td>
                <td>{{ device.ip }}</td>
                <td>{{ formatDate(device.lastBackup) }}</td>
                <td>{{ device.runtime }}</td>
                <td>
                  <div class="d-flex gap-2">
                    <button class="btn btn-primary btn-sm" @click="runBackup(device)">
                      Run backup
                    </button>
                    <button class="btn btn-primary btn-sm" @click="downloadBackup(device)">
                      Download
                    </button>
                    <div class="dropdown">
                      <button class="badge dropdown-toggle border-0 btn-outline-primary" type="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        Details
                      </button>
                      <ul class="dropdown-menu shadow-sm" :aria-labelledby="`device-${device.ip}`">
                        <li>
                          <NuxtLink class="dropdown-item" :to="`/configuration-backup/${device.ip}`">
                            <i class="bi bi-hdd-stack me-2"></i>
                            Configuration Backup Report
                          </NuxtLink>
                        </li>
                        <li>
                          <NuxtLink class="dropdown-item" :to="`/pm-report/${device.ip}`">
                            <i class="bi bi-clipboard-data me-2"></i>
                            Preventive Maintenance Report
                          </NuxtLink>
                        </li>
                        <li>
                          <NuxtLink class="dropdown-item" :to="`/compliance-report/${device.ip}`">
                            <i class="bi bi-clipboard-data me-2"></i>
                            Compliance Report
                          </NuxtLink>
                        </li>
                      </ul>
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- <div class="d-flex justify-content-center mt-4">
      <button class="btn btn-primary px-4" @click="runAllBackups">
        Run Backup
      </button>
    </div> -->
  </div>
</template>

<script setup lang="ts">
interface Device {
  type: string;
  ip: string;
  lastBackup: string;
  runtime: string;
}

// Sample data - replace with actual API call
const devices: Device[] = [
  {
    type: "Cisco",
    ip: "10.10.0.131",
    lastBackup: "2024-09-24",
    runtime: "02m 15s",
  },
  {
    type: "Cisco",
    ip: "10.10.0.132",
    lastBackup: "2024-09-25",
    runtime: "03m 0s",
  },
  {
    type: "Cisco",
    ip: "10.10.0.133",
    lastBackup: "2024-09-25",
    runtime: "01m 45s",
  },
  {
    type: "FortiGate",
    ip: "10.10.0.1",
    lastBackup: "2024-09-25",
    runtime: "02m 15s",
  },
  {
    type: "Cisco",
    ip: "10.10.0.131",
    lastBackup: "2024-09-25",
    runtime: "02m 15s",
  },
  {
    type: "Cisco",
    ip: "10.10.0.131",
    lastBackup: "2024-09-25",
    runtime: "02m 15s",
  },
  {
    type: "Cisco",
    ip: "10.10.0.131",
    lastBackup: "2024-09-25",
    runtime: "02m 15s",
  },
];

// Computed value for current date
const currentDate = computed(() => {
  return new Date().toLocaleDateString("en-GB", {
    day: "2-digit",
    month: "2-digit",
    year: "numeric",
  });
});

const getDeviceTypeBadgeClass = (type: string) => {
  const classes = {
    Cisco: "bg-primary",
    FortiGate: "bg-success",
  };
  return classes[type as keyof typeof classes] || "bg-secondary";
};

const formatDate = (date: string) => {
  return new Date(date).toLocaleDateString("en-GB", {
    day: "2-digit",
    month: "2-digit",
    year: "numeric",
  });
};

const runBackup = async (device: Device) => {
  // Implement backup logic here
  console.log(`Running backup for device: ${device.ip}`);
};

const downloadBackup = async (device: Device) => {
  // Implement download logic here
  console.log(`Downloading backup for device: ${device.ip}`);
};

const runAllBackups = async () => {
  // Implement logic to run all backups
  console.log("Running all backups");
};
</script>

<style scoped>
.badge {
  font-size: 0.9em;
  padding: 0.5em 1em;
  cursor: pointer;
}

.badge.dropdown-toggle::after {
  margin-left: 0.5em;
  vertical-align: middle;
}

.table th {
  font-weight: 500;
  color: #666;
}

.table td {
  vertical-align: middle;
}

/* Custom button styles */
.xclick:hover {
  cursor: default;
}

.btn-primary {
  background-color: #0046c0;
  border-color: #0046c0;
}

.btn-outline-primary {
  color: #0046c0;
  border-color: #0046c0;
}

.btn-outline-primary:hover {
  background-color: #0046c0;
  border-color: #0046c0;
  color: #f8f9fa;
}

/* Dropdown styles */
.dropdown-item {
  padding: 0.5rem 1rem;
  color: #333;
  text-decoration: none;
}

.dropdown-item:hover {
  background-color: #f8f9fa;
  color: #0046c0;
}

.dropdown-item i {
  color: #666;
}

.dropdown-item:hover i {
  color: #0046c0;
}
</style>
