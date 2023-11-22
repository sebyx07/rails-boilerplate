import {Application} from "~/application/components/application";
import {createRoot} from "react-dom/client";
import {StrictMode} from "react";

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('react-root')
  if(!rootEl) return

  const root = createRoot(rootEl)

  root.render(<Application />)
})