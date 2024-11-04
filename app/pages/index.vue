<template>
  <div class="row" style="height: 100vh;">
    <div class="col-auto">
      <SideBar />
    </div>
    <div class="col d-flex flex-column">
      <div class="container text-center">
        <h2 class="mt-4">PREVENTIVE MAINTENANCE REPORT</h2>
        <div class="row my-4">
          <div class="col d-flex justify-content-start align-items-center">
            <p class="mb-0">Date: {{ currentDate }} (Today)</p>
          </div>
          <div class="col d-flex justify-content-end align-items-center">
            <p class="fw-bold mb-0">Download</p>
            <span class="px-2">
              <img src="/img/download.png" alt="Ansible Demo" style="width: 30px"/>
            </span>
          </div>
        </div>
        <div>
          <div class="card custom-card">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table table-striped table-hover table-borderless">
                  <thead>
                    <tr class="text-nowrap">
                      <th scope="col">Action</th>
                      <th scope="col">IP Address(es)</th>
                      <th scope="col">Hardware Model</th>
                      <th scope="col">Vendor</th>
                      <th scope="col">Hostname</th>
                      <th scope="col">Serial Number</th>
                      <th scope="col">Uptime</th>
                      <th scope="col">PID</th>
                      <th scope="col">a</th>
                      <th scope="col">b</th>
                      <th scope="col">c</th>
                      <th scope="col">d</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="(pmMockData, index) in pmMockDatas"
                        :key="index"
                        style="white-space: pre;"
                        class="text-left">
                      <td>
                        <a class="btn btn-primary" href="#" role="button" style="margin-top:0;">{{ pmMockData.index }}</a>
                      </td>
                      <td> {{ pmMockData.ipAddress }}</td>
                      <td>{{ pmMockData.hardwareModel }}</td>
                      <td>{{ pmMockData.vendor }}</td>
                      <td>{{ pmMockData.hostname }}</td>
                      <td>{{ pmMockData.serialNum }}</td>
                      <td>{{ pmMockData.uptime }}</td>
                      <td>{{ pmMockData.PID }}</td>
                      <td>affdfssssss</td>
                      <td>bsfffffffff</td>
                      <td>csfddddddddddddddd</td>
                      <td>dsfdddddddddddd</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div>
          <a class="btn btn-primary genReportBtn" href="#" role="button">Generate Report</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
  import { ref } from 'vue'

  const currentDate = ref(getCurrentDate());

  function getCurrentDate() {
    const date = new Date();
    return date.toLocaleDateString('en-GB');
  }

  const pmMockDatas = ref([
    { ipAddress: '10.10.0.131', vendor: 'Cisco', hardwareModel: 'Cisco NXOS', hostname: 'NTT_LAB_CORE_1', serialNum: 'ZDO1439Z0A7', uptime: '12 weeks, 12 hours, 56 minutes', PID: 'WS-C3750X-48PF', index: 'Details' },
    { ipAddress: '10.10.0.132', vendor: 'Cisco', hardwareModel: 'Cisco NXOS', hostname: 'NTT_LAB_CORE_2', serialNum: 'CDO1539Z0A7', uptime: '8 weeks, 8 hours, 56 minutes', PID: 'AZ-C3750X-48PF', index: 'Details'},
    { ipAddress: '10.10.0.01', vendor: 'Fortigate', hardwareModel: 'Fortinet Fortigate', hostname: 'NTT_LAB_CORE_3', serialNum: 'BPZ1123323X0', uptime: '1 weeks, 12 hours, 56 minutes', PID: 'WS-C457-453R', index: 'Details' },
    { ipAddress: '10.10.0.206', vendor: 'Cisco', hardwareModel: 'Cisco IOS', hostname: 'NTT_LAB_CORE_4', serialNum: 'ACO1539Z0A7', uptime: '8 weeks, 13 hours, 50 minutes', PID: 'BC-D3750X-48PF', index: 'Details' },
  ])
</script>

<style scoped>
    .custom-card {
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      border: none;
    }
    td {
      padding: 20px;
    }
    .genReportBtn {
      margin-top: 5%;
      background-color: #023E8A;
    }
</style>
