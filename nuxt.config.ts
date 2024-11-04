import { defineNuxtConfig } from "nuxt/config";

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },

  compatibilityDate: "2024-04-03",

  future: {
    compatibilityVersion: 4,
  },

  // To re-enable _all_ Nuxt v3 behavior, set the following options:
  // srcDir: ".",
  // dir: {
  //   app: "app",
  // },
  experimental: {
    // scanPageMeta: 'after-resolve',
    sharedPrerenderData: false,
    compileTemplate: true,
    resetAsyncDataToUndefined: true,
    templateUtils: true,
    relativeWatchPaths: true,
    // normalizeComponentNames: false
    defaults: {
      useAsyncData: {
        deep: true,
      },
    },
  },

  unhead: {
    renderSSRHeadOptions: {
      omitLineBreaks: false,
    },
  },

  modules: ["@nuxtjs/google-fonts", "@nuxt/icon", "@nuxt/image"],
  css: [
    "bootstrap/dist/css/bootstrap.min.css",
    "bootstrap-icons/font/bootstrap-icons.css",
    "~/assets/css/global.css",
  ],
  plugins: [{ src: "~/plugins/bootstrap.client.ts", mode: "client" }],
  app: {
    head: {
      script: [
        {
          src: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js",
          tagPosition: "bodyClose",
        },
      ],
    },
  },
  // googleFonts: {
  //   families: {
  //     Montserrat: "Montserrat, sans-serif",
  //   },
  // },
});
