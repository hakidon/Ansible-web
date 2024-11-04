<!-- components/Sidebar.vue -->
<template>
  <div class="sidebar bg-color ">
    <div class="d-flex flex-column min-vh-100">
      <!-- Logo Section -->
      <div class="px-2 pt-2">
        <NuxtLink to="/home"
          class="brand-link d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
          <span class="logo-container">
            <img src="/img/ntt-logo.png" class="w-100" />
          </span>
        </NuxtLink>
      </div>

      <!-- Main Navigation Section -->
      <div class="flex-grow-1 px-2">
        <ul class="nav nav-pills flex-column mb-sm-auto mb-0" id="menu">
          <li v-for="item in navigationItems" :key="item.path" class="nav-item">
            <NuxtLink :to="item.path" class="nav-link px-2 d-flex align-items-center" :class="{
              active: isActive(item.path),
              'text-white': !isActive(item.path),
            }">
              <div class="icon-wrapper">
                <img :src="item.icon" :alt="item.alt" class="dashboard-icon" />
              </div>
              <span class="ms-3 menu-text">{{ item.title }}</span>
            </NuxtLink>
          </li>
        </ul>
      </div>

      <!-- Bottom Navigation Section -->
      <div class="bottom-section px-2 pb-3">
        <NuxtLink to="/architecture-diagram" class="nav-link px-2 d-flex align-items-center" :class="{
          active: isActive('/architecture-diagram'),
          'text-white': !isActive('/architecture-diagram'),
        }">
          <div class="icon-wrapper">
            <img src="/img/architecture.png" alt="Architecture" class="dashboard-icon" />
          </div>
          <span class="ms-3 d-none d-sm-inline menu-text">Architecture diagram</span>
        </NuxtLink>
      </div>
    </div>
  </div>
</template>

<script setup>
import { defineProps } from 'vue';

const props = defineProps({
  logoName: {
    type: String,
    default: "Menu"
  },
  navigationItems: {
    type: Array,
    required: true
  },
  currentPath: {
    type: String,
    required: true
  }
});

const isActive = (path) => {
  if (!props.navigationItems.some(item => item.path === props.currentPath)) {
    return path === "/home";
  }
  return path === props.currentPath;
};
</script>

<style scoped>
.icon-wrapper {
  background-color: rgba(255, 255, 255, 0.1);
  border-radius: 50%;
  padding: 1rem;
  width: 50px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.dashboard-icon {
  width: 25px;
  height: 25px;
  filter: brightness(0) invert(1);
}

.sidebar {
  width: 250px;
  min-width: 240px;
  /* Added min-width to prevent squeezing */
  transition: all 0.3s;
  background-color: #2828ff;
  height: 100vh;
  overflow-y: auto;
}

.logo-container {
  width: 100%;
  max-width: 200px;
  display: block;
  margin: 0 auto;
}

.nav-options {
  background-color: #F0F0F0;
  padding: 9px;
  flex-shrink: 0;
}

.nav-options-blanked {
  width: 40px;
  height: 40px;
  min-width: 40px;
}

.nav-link {
  color: rgba(255, 255, 255, 0.8);
  display: flex;
  align-items: center;
  padding: 12px;
  border-radius: 8px;
  margin-bottom: 4px;
}

.nav-link:hover {
  color: white;
  background-color: rgba(255, 255, 255, 0.1);
}

.nav-link.active {
  background-color: #0d6efd;
  color: white;
}

.menu-text {
  overflow: hidden;
  margin-left: 12px;
  font-size: 14px;
}

/* Mobile Styles */
@media (max-width: 768px) {
  .sidebar {
    width: 80px;
    min-width: 80px;
  }

  .logo-container {
    max-width: 60px;
  }

  .menu-text {
    display: none;
    /* Hide text on mobile */
  }

  .nav-link {
    padding: 8px;
    justify-content: center;
  }

  .nav-options-blanked {
    width: 32px;
    height: 32px;
    min-width: 32px;
  }
}

@media (max-width: 768px) {
  :deep(.main-content) {
    margin-left: 80px;
  }
}

/* Bottom section styles */
.bottom-section {
  margin-top: auto;
  width: 100%;
  padding: 12px;
}
</style>