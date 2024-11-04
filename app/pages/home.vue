<template>
    <div class="dashboard-container">
        <div class="container py-4">
            <div class="row g-4">
                <!-- Configuration Backup Card -->
                <div class="col-md-6">
                    <div class="dashboard-card config-backup">
                        <div class="card-content">
                            <div class="d-flex flex-column h-100">
                                <!-- Main Card Content -->
                                <div class="d-flex justify-content-between align-items-start flex-grow-1">
                                    <h2>Configuration<br />Backup</h2>
                                    <div class="icon-wrapper">
                                        <img src="/icons/home/cb-w.png" alt="Configuration" class="dashboard-icon" />
                                    </div>
                                </div>

                                <!-- Dropdown Container -->
                                <div class="dropdown-container">
                                    <div class="dropdown">
                                        <button class="btn dropdown-toggle text-white" type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            Show list of devices
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-end shadow-sm">
                                            <li v-for="device in devices" :key="device.ip">
                                                <NuxtLink class="dropdown-item"
                                                    :to="`/configuration-backup/${device.ip}`">
                                                    <i class="bi bi-hdd-stack me-2"></i>
                                                    {{ device.ip }} - {{ device.type }}
                                                </NuxtLink>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Preventive Maintenance Card -->
                <div class="col-md-6">
                    <div class="dashboard-card maintenance">
                        <div class="card-content">
                            <div class="d-flex flex-column h-100">
                                <div class="d-flex justify-content-between align-items-start flex-grow-1">
                                    <h2>Preventive<br />Maintenance<br />Report</h2>
                                    <div class="icon-wrapper">
                                        <img src="/icons/home/pm-report-w.png" alt="Maintenance"
                                            class="dashboard-icon" />
                                    </div>
                                </div>

                                <div class="dropdown-container">
                                    <div class="dropdown">
                                        <button class="btn dropdown-toggle text-white" type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            Show list of devices
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-end shadow-sm">
                                            <li v-for="device in devices" :key="device.ip">
                                                <NuxtLink class="dropdown-item" :to="`/pm-report/${device.ip}`">
                                                    <i class="bi bi-hdd-stack me-2"></i>
                                                    {{ device.ip }} - {{ device.type }}
                                                </NuxtLink>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Compliance Report Card -->
                <div class="col-md-6">
                    <div class="dashboard-card compliance">
                        <div class="card-content">
                            <div class="d-flex flex-column h-100">
                                <div class="d-flex justify-content-between align-items-start flex-grow-1">
                                    <h2>Compliance<br />Report</h2>
                                    <div class="icon-wrapper">
                                        <img src="/icons/home/compliance-report-w.png" alt="Compliance"
                                            class="dashboard-icon" />
                                    </div>
                                </div>

                                <div class="dropdown-container">
                                    <div class="dropdown">
                                        <button class="btn dropdown-toggle text-white" type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            Show list of devices
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-end shadow-sm">
                                            <li v-for="device in devices" :key="device.ip">
                                                <NuxtLink class="dropdown-item" :to="`/compliance-report/${device.ip}`">
                                                    <i class="bi bi-hdd-stack me-2"></i>
                                                    {{ device.ip }} - {{ device.type }}
                                                </NuxtLink>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Kill Switch Card -->
                <div class="col-md-6">
                    <div class="dashboard-card kill-switch">
                        <div class="card-content">
                            <div class="d-flex flex-column h-100">
                                <div class="d-flex justify-content-between align-items-start flex-grow-1">
                                    <h2>Kill<br />Switch</h2>
                                    <div class="icon-wrapper">
                                        <img src="/icons/home/ks.png" alt="Kill Switch" class="dashboard-icon" />
                                    </div>
                                </div>

                                <div class="dropdown-container">
                                    <div class="dropdown">
                                        <button class="btn dropdown-toggle text-white" type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            Show list of devices
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-end shadow-sm">
                                            <li v-for="device in devices" :key="device.ip">
                                                <NuxtLink class="dropdown-item"
                                                    :to="`/configuration-backup/${device.ip}`">
                                                    <i class="bi bi-hdd-stack me-2"></i>
                                                    {{ device.ip }} - {{ device.type }}
                                                </NuxtLink>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- List of Devices Button -->
                <div class="row mt-4">
                    <div class="col-12 d-flex justify-content-center">
                        <NuxtLink to="/devices" class="devices-btn">
                            List of Devices
                        </NuxtLink>
                    </div>
                </div>

                <!-- Disclaimer -->
                <div class="disclaimer text-center mt-4">
                    Disclaimer: This demo is for display purposes only and may not be an exact representation of the
                    product.
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.dashboard-container {
    min-height: 100vh;
    background-color: #f8f9fa;
    padding: 20px;
}

.dashboard-card {
    background-color: #003087;
    border-radius: 10px;
    transition: transform 0.3s ease;
    height: 100%;
    /* Ensures minimum height for all cards */
    min-height: 180px;
}

.dashboard-card:hover {
    transform: translateY(-5px);
}

.card-content {
    padding: 2rem;
    color: white;
    text-decoration: none;
    display: block;
    height: 100%;
}

.dropdown-container {
    display: flex;
    justify-content: flex-end;
    margin-top: auto;
    padding-top: 1rem;
}

.dropdown-toggle {
    background: transparent;
    border: none;
    padding: 0;
    color: white;
    font-size: 0.9em;
}

.dropdown-toggle:hover,
.dropdown-toggle:focus {
    color: white;
    background: transparent;
}

.dropdown-menu {
    min-width: 200px;
}

h2 {
    font-size: 1.5rem;
    margin: 0;
    font-weight: 500;
    line-height: 1.3;
}

.icon-wrapper {
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 50%;
    padding: 1rem;
    width: 70px;
    height: 70px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.dashboard-icon {
    width: 40px;
    height: 40px;
    filter: brightness(0) invert(1);
}

.devices-btn {
    background-color: #003087;
    color: white;
    padding: 0.75rem 5rem;
    border-radius: 5px;
    text-decoration: none;
    font-weight: 500;
    transition: background-color 0.3s ease;
}

.devices-btn:hover {
    background-color: #002266;
    color: white;
}

.disclaimer {
    color: #6c757d;
    font-size: 0.9rem;
}

@media (max-width: 768px) {
    .dashboard-card {
        margin-bottom: 1rem;
    }

    .card-content {
        padding: 1.5rem;
    }

    h2 {
        font-size: 1.3rem;
    }

    .icon-wrapper {
        width: 60px;
        height: 60px;
    }

    .dashboard-icon {
        width: 30px;
        height: 30px;
    }
}
</style>

<script setup>
const devices = ref([
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
        type: "FortiGate",
        ip: "10.10.0.1",
        lastBackup: "2024-09-25",
        runtime: "02m 15s",
    }
]);
</script>