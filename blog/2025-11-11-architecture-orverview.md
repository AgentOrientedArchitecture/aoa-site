---
title: Understanding the AOA Stack
authors:
  - name: Lewis Crawford
    title: AOA Maintainer
tags: [architecture, overview]
---

The AOA stack mirrors the evolution of software from monoliths to microservices.

At its core are **Agentic Units** — self-contained, model-powered components that expose capabilities through structured interfaces.

Each AU can:
- Perceive structured or unstructured inputs
- Use models or tools to reason
- Emit structured results (e.g. JSON, graph events)
- Register itself in a semantic registry for discovery

```mermaid
graph LR
  intent([User Intent]) --> planner(Planner AU)
  planner --> orchestrator(Orchestrator AU)
  orchestrator --> au1[OCR AU]
  orchestrator --> au2[LLM Evaluator AU]
  au1 --> memory[(Graph Memory)]
  au2 --> report[(Result Summary)]
