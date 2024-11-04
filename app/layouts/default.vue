<!-- layouts/default.vue -->
<template>
  <div class="d-flex vh-100"> <!-- Add vh-100 to make it full height -->
    <SideBar :navigation-items="navigationItems" :current-path="currentPath" logo-name="Ansible" />
    <main class="flex-grow-1 d-flex flex-column overflow-hidden">
      <div class="flex-grow-1 overflow-auto">
        <slot />
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { onMounted, computed } from "vue";
import { useRouter, useRoute } from "vue-router";

const router = useRouter();
const route = useRoute();

// Always redirect to device list if on root path
onMounted(() => {
  if (route.path === "/") {
    router.push("/device-list");
  }
});

const navigationItems = [
  {
    title: "Home",
    path: "/device-list",
    icon: "/img/home.png",
    alt: "",
  },
  {
    title: "Configuration Backup",
    path: "/config-backup",
    icon: "/img/cb.png",
    alt: "",
  },
  {
    title: "Preventive Maintenance Report",
    path: "/maintenance-report",
    icon: "/img/pm-report.png",
    alt: "",
  },
  {
    title: "Compliance Report",
    path: "/compliance-report",
    icon: "/img/compliance-report.png",
    alt: "",
  },
  {
    title: "Kill Switch",
    path: "/compliance-report",
    icon: "/img/kill-switch.png",
    alt: "",
  },
  {
    title: "List of Devices",
    path: "/compliance-report",
    icon: "/img/switches.png",
    alt: "",
  },
];

const currentPath = computed(() => {
  // If the current route is not in navigationItems, default to device-list
  const isValidPath = navigationItems.some((item) => item.path === route.path);
  return isValidPath ? route.path : "/device-list";
});
</script>

<style>
body {
  margin: 0;
  overflow: hidden;
}

main {
  height: 100vh;
}

@font-face {
  font-family: 'Navbar Link Font';
  src: url('public/font/Inter-VariableFont_opsz,wght.ttf');
}

.nav-font {
  font-family: 'Navbar Link Font';
  font-weight: 200;
  font-size: 15px;
}
</style>
