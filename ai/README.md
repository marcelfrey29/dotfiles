# AI

```
ai/
├── README.md
├── agents/
│   ├── agent-1.md
│   └── agent-2.md
├── skills/
│   ├── skill-1/
│   │   └── SKILL.md
│   └── skill-2/
│       ├── SKILL.md
│       └── scripts/
│           ├── prepare.sh
│           └── check.sh
└── tools/
    ├── tool-1.ts
    └── tool-2.ts
```

## Agents

Specialized AI Assistants for specific tasks and workflows.

[OpenCode Agents](https://opencode.ai/docs/agents/)

## Skills

Specialized knowledge and workflows for Agents.

[Agent Skills](https://agentskills.io/specification)

```
skill-name/
├── SKILL.md              # Required: instructions and metadata
├── scripts/              # Executable code
│   └── script.[sh|js|py] # Self contained with proper error and edge case handling
├── references/           # Additional documentation & Domain-Knowledge
│   ├── REFERENCE.md      # Technical Reference
│   ├── FORMS.md          # Form templates / structured data formats
│   └── <domain>.md       # Domain-Knowledge
└── assets/               # Templates, Images, Diagrams, Lookup Tables, Schemas
```

```md
---
name: skill-name
description: description of the skill
metadata:
    author: Marcel Frey
    version: 1.0
---

# Skill Name

<!-- Step by Step instructions -->

## Step 1

- ...
- ...

## Step 2

- ...
- ...
```

## Tools

Functions the LLM can call/use.
Like MCP Servers, but lightweight and local.

[OpenCode Custom Tools](https://opencode.ai/docs/custom-tools/)

Written in TypeScript:

```ts
import { tool } from "@opencode-ai/plugin"

export const multiply = tool({
  description: "Multiply two numbers",
  args: {
    a: tool.schema.number().describe("First number"),
    b: tool.schema.number().describe("Second number"),
  },
  async execute(args) {
    return args.a * args.b
  },
})
```
