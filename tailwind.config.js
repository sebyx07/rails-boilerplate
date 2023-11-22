/** @type {import('tailwindcss').Config} */
module.exports = {
  jit: true,
  corePlugins: {
    preflight: false
  },
  important: true,
  content: [
    './app/views/**/*.html.erb',
    './app/frontend/**/*.jsx',
    './app/frontend/**/*.js',
    './app/frontend/**/*.tsx',
    './app/frontend/**/*.ts',
  ],
  purge: {
    content: [
      './app/views/**/*.html.erb',
      './app/frontend/**/*.jsx',
      './app/frontend/**/*.js',
      './app/frontend/**/*.tsx',
      './app/frontend/**/*.ts',
    ],
  },
  theme: {
    extend: {},
  },
  plugins: [],
}

