/* Margadarshak project site — small, dependency-free enhancements. */
(() => {
  "use strict";

  const prefersReducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  /* ---------------------------------------------------------------- header */
  const header = document.querySelector("[data-header]");
  const onScroll = () => {
    if (!header) return;
    header.classList.toggle("is-scrolled", window.scrollY > 8);
  };
  onScroll();
  window.addEventListener("scroll", onScroll, { passive: true });

  /* ----------------------------------------------------------- mobile menu */
  const toggle = document.querySelector("[data-nav-toggle]");
  const menu = document.querySelector("[data-mobile-menu]");

  const setMenu = (open) => {
    if (!toggle || !menu) return;
    toggle.setAttribute("aria-expanded", String(open));
    toggle.setAttribute("aria-label", open ? "Close menu" : "Open menu");
    menu.hidden = !open;
    document.body.classList.toggle("menu-open", open);
  };

  if (toggle && menu) {
    toggle.addEventListener("click", () => {
      setMenu(toggle.getAttribute("aria-expanded") !== "true");
    });

    menu.addEventListener("click", (event) => {
      if (event.target.closest("a")) setMenu(false);
    });

    document.addEventListener("keydown", (event) => {
      if (event.key === "Escape" && toggle.getAttribute("aria-expanded") === "true") {
        setMenu(false);
        toggle.focus();
      }
    });

    document.addEventListener("click", (event) => {
      if (toggle.getAttribute("aria-expanded") !== "true") return;
      if (event.target.closest("[data-header]")) return;
      setMenu(false);
    });

    window.addEventListener("resize", () => {
      if (window.innerWidth > 900) setMenu(false);
    });
  }

  /* -------------------------------------------------------- reveal on scroll */
  const revealItems = Array.from(document.querySelectorAll("[data-reveal]"));

  if (!prefersReducedMotion && "IntersectionObserver" in window) {
    const groups = new Map();
    revealItems.forEach((item) => {
      const parent = item.parentElement;
      if (!parent) return;
      const siblings = groups.get(parent) || [];
      siblings.push(item);
      groups.set(parent, siblings);
    });

    groups.forEach((items, parent) => {
      if (items.length < 2 || parent.classList.contains("hero__copy")) return;
      items.forEach((item, index) => {
        item.style.setProperty("--reveal-delay", `${Math.min(index * 0.055, 0.28)}s`);
      });
    });

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (!entry.isIntersecting) return;
          entry.target.classList.add("is-visible");
          observer.unobserve(entry.target);
        });
      },
      { threshold: 0.12, rootMargin: "0px 0px -7% 0px" }
    );

    revealItems.forEach((item) => observer.observe(item));
  } else {
    revealItems.forEach((item) => item.classList.add("is-visible"));
  }

  /* --------------------------------------------------------- eligibility demo */
  const demo = document.querySelector("[data-demo]");

  if (demo) {
    const tabs = Array.from(demo.querySelectorAll("[data-demo-tab]"));
    const panels = Array.from(demo.querySelectorAll("[data-demo-panel]"));

    const activate = (name) => {
      tabs.forEach((tab) => {
        const active = tab.dataset.demoTab === name;
        tab.classList.toggle("is-active", active);
        tab.setAttribute("aria-selected", String(active));
        tab.tabIndex = active ? 0 : -1;
      });

      panels.forEach((panel) => {
        panel.hidden = panel.dataset.demoPanel !== name;
      });
    };

    tabs.forEach((tab, index) => {
      tab.addEventListener("click", () => activate(tab.dataset.demoTab));

      tab.addEventListener("keydown", (event) => {
        let nextIndex = null;

        if (event.key === "ArrowRight") nextIndex = (index + 1) % tabs.length;
        if (event.key === "ArrowLeft") nextIndex = (index - 1 + tabs.length) % tabs.length;
        if (event.key === "Home") nextIndex = 0;
        if (event.key === "End") nextIndex = tabs.length - 1;

        if (nextIndex === null) return;
        event.preventDefault();
        const next = tabs[nextIndex];
        activate(next.dataset.demoTab);
        next.focus();
      });
    });

    if (tabs.length && panels.length) activate(tabs[0].dataset.demoTab);
  }

  /* ------------------------------------------------------------- copy button */
  const copyButtons = Array.from(document.querySelectorAll("[data-copy-target]"));

  copyButtons.forEach((button) => {
    button.addEventListener("click", async () => {
      const target = document.getElementById(button.dataset.copyTarget);
      if (!target) return;

      const text = target.textContent.trim();
      const label = button.querySelector("[data-copy-label]");
      const original = label ? label.textContent : "Copy";

      try {
        if (navigator.clipboard && window.isSecureContext) {
          await navigator.clipboard.writeText(text);
        } else {
          const area = document.createElement("textarea");
          area.value = text;
          area.setAttribute("readonly", "");
          area.style.position = "fixed";
          area.style.opacity = "0";
          document.body.appendChild(area);
          area.select();
          document.execCommand("copy");
          area.remove();
        }

        button.classList.add("is-copied");
        if (label) label.textContent = "Copied";
        window.setTimeout(() => {
          button.classList.remove("is-copied");
          if (label) label.textContent = original;
        }, 2000);
      } catch {
        if (label) label.textContent = "Select the text";
        window.setTimeout(() => {
          if (label) label.textContent = original;
        }, 2000);
      }
    });
  });

  /* -------------------------------------------------------------- scrollspy */
  const navLinks = Array.from(document.querySelectorAll('.site-nav a[href^="#"]'));
  const navSections = navLinks
    .map((link) => document.querySelector(link.getAttribute("href")))
    .filter(Boolean);

  if (navSections.length) {
    let ticking = false;

    const updateActive = () => {
      ticking = false;
      let current = null;
      const marker = window.scrollY + 150;

      navSections.forEach((section) => {
        if (section.offsetTop <= marker) current = section.id;
      });

      navLinks.forEach((link) => {
        link.classList.toggle("is-active", link.getAttribute("href") === `#${current}`);
      });
    };

    const requestUpdate = () => {
      if (ticking) return;
      ticking = true;
      window.requestAnimationFrame(updateActive);
    };

    updateActive();
    window.addEventListener("scroll", requestUpdate, { passive: true });
    window.addEventListener("resize", requestUpdate);
  }

  /* ------------------------------------------------------------------ year */
  const year = document.querySelector("[data-year]");
  if (year) year.textContent = String(new Date().getFullYear());
})();
