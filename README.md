# ModularWork-Framework

Базовый фреймворк для модульной работы с данными и событиями.

Фреймворк не поддерживает Windows, используйте WSL.

## Установка

```bash
git clone https://github.com/Modular-Content/ModularWork-Framework.git
```

## 🧩 ModularWork Constitution

**Version:** 0.1 (Draft)

**Status:** Foundational document

---

## 1. Purpose

ModularWork is **not a gamemode**, **not an addon**, and **not a content pack**.

ModularWork is a **runtime framework and ecosystem** for building independent game schemas and services on top of Garry’s Mod.

Any system that contradicts this definition is considered invalid.

---

## 2. Core Principles

### 2.1 Source of Truth

* There MUST exist a single authoritative source of truth for persistent data.
* In ModularWork, this role is performed by the **Game Coordinator**.
* Local server state is **cache**, not truth.

Any system that allows permanent divergence between server state and Game Coordinator state is forbidden.

---

### 2.2 Determinism over Convenience

* Deterministic behavior is always preferred over convenience.
* Implicit side effects are forbidden.
* All state mutations MUST be explicit and traceable.

If behavior cannot be explained, it is considered broken.

---

### 2.3 Runtime Independence

* Game servers MUST remain operational when external services are unavailable.
* External service failure MUST degrade functionality, not terminate gameplay.
* Game Coordinator downtime MUST NOT crash or freeze servers.

Data is queued, batched, and synchronized when connectivity is restored.

---

## 3. Core Modules

### 3.1 Mandatory Core

The following modules form the **irreducible core** of ModularWork:

* `mwlib`
* Administration system
* Configuration system
* Core spawn menu
* Core toolgun

These modules define the execution environment.

They MAY be disabled via configuration but MUST remain present.

Removal or modification of core modules is forbidden.

---

### 3.2 Core Immutability

* Core modules MUST NOT depend on schemas.
* Schemas MUST depend on core modules.
* Core APIs are backward-compatible or versioned.

Breaking core contracts without migration is forbidden.

---

## 4. Schemas

### 4.1 Schema Definition

A schema is a **composed set of modules** that defines:

* gameplay rules
* data types
* progression systems
* player interaction logic

Examples include but are not limited to:

* RP schemas
* Simulation schemas
* Scenario-based schemas

---

### 4.2 Schema Isolation

* Schemas MUST NOT mutate global core state.
* Schemas MUST NOT assume the presence of other schemas.
* Inter-schema communication MUST go through explicit interfaces.

---

## 5. Data Model

### 5.1 Data Types

* All persistent data MUST be registered as a **data type**.
* Data types MUST be versioned.
* Data types MUST define:

  * structure
  * ownership
  * lifecycle
  * mutation rules

Unregistered data does not exist.

---

### 5.2 Data Mutation

* All persistent mutations MUST pass through Game Coordinator or its cache layer.
* Direct writes bypassing Game Coordinator authority are forbidden.
* Emergency local writes MUST be reconciled or discarded.

---

## 6. Game Coordinator

### 6.1 Authority

* Game Coordinator is the sole authority for:

  * persistent player data
  * permissions
  * cross-server state

Game servers MAY read cached state but MUST NOT claim authority.

---

### 6.2 Failure Mode

* Game Coordinator failure is a degraded mode, not a fatal error.
* Servers MUST:

  * enter cache mode
  * queue mutations
  * preserve gameplay continuity

Upon Game Coordinator recovery, reconciliation MUST be deterministic.

---

## 7. External Services

* External services MUST NOT be trusted as authoritative.
* Services MAY read from Game Coordinator.
* Services MAY request mutations through Game Coordinator APIs.
* Services MUST tolerate Game Coordinator validation and throttling.

---

## 8. Observability and Explainability

* The system MUST be introspectable.
* It MUST be possible to answer:

  * *what exists*
  * *why it exists*
  * *who can mutate it*
  * *what depends on it*

If a system cannot be explained, it is invalid.

---

## 9. Debugging and Validation

* ModularWork MUST provide diagnostic tools.
* Environment validation MUST be automated.
* Inconsistent states MUST be detectable.

Silent corruption is unacceptable.

---

## 10. Evolution

* Architectural rules evolve slower than code.
* Backward compatibility is preferred over rewrites.
* Breaking changes MUST be explicit and documented.

---

## 11. Non-Goals

ModularWork does NOT aim to:

* replace Garry’s Mod
* simplify development for beginners
* maximize popularity

Correctness, scalability, and control are prioritized.

---

## 12. Final Rule

> **If a system violates this constitution but “works”,
> it is still considered broken.**