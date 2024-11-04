<template>
  <div class="card custom-card h-100">
    <div class="card-body d-flex flex-column p-0">
      <div class="table-responsive flex-grow-1">
        <div class="table-container">
          <table class="table table-hover mb-0">
            <thead>
              <tr>
                <th v-for="column in columns" :key="column.key" scope="col"
                  class="text-nowrap white-space-nowrap sticky-header">
                  {{ column.label }}
                </th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(row, index) in data" :key="index">
                <td v-for="column in columns" :key="column.key" class="text-nowrap white-space-nowrap">
                  <template v-if="column.type === 'button'">
                    <button class="btn btn-primary btn-sm" @click="handleAction(row, column.key)">
                      {{ column.key }}
                    </button>
                  </template>
                  <template v-else>
                    {{ row[column.key] }}
                  </template>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
const props = defineProps({
  columns: {
    type: Array,
    required: true,
    validator: (value) => {
      return value.every(column =>
        typeof column.key === 'string' &&
        typeof column.label === 'string' &&
        (!column.type || ['text', 'button'].includes(column.type))
      )
    }
  },
  data: {
    type: Array,
    required: true
  }
})

const emit = defineEmits(['action'])

const handleAction = (row, key) => {
  emit('action', { row, key })
}
</script>

<style scoped>
/* Table container styles */
.table-container {
  width: 100%;
  min-width: 100%;
  overflow-x: auto;
}

/* Prevent text wrapping */
.white-space-nowrap {
  white-space: nowrap !important;
}

/* Custom scrollbar styles */
.table-container::-webkit-scrollbar {
  height: 8px;
}

.table-container::-webkit-scrollbar-track {
  background: #f1f1f1;
}

.table-container::-webkit-scrollbar-thumb {
  background: #888;
  border-radius: 4px;
}

.table-container::-webkit-scrollbar-thumb:hover {
  background: #555;
}

/* Remove right padding from last column */
.table td:last-child,
.table th:last-child {
  padding-right: 1.5rem;
}

/* Add left padding to first column */
.table td:first-child,
.table th:first-child {
  padding-left: 1.5rem;
}

/* Ensure table takes full width */
.table {
  margin-bottom: 0;
  width: 100%;
}

/* Ensure card body has no padding to maximize space */
.card-body {
  padding: 0;
}

.custom-card {
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  border: none;
}
</style>