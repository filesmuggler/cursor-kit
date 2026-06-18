---
name: robotics-task-planning
description: Plan a robotics task by mapping sensors, actuators, topics/services, control loops, and safety constraints. Use before implementing robot behaviors, ROS2 nodes, or control logic.
---

# Robotics Task Planning

Map the system before writing node code. Inspect existing ROS packages and parameter files first.

## Workflow

```
- [ ] 1. Research: existing packages, nodes, message types, and parameter files
- [ ] 2. Goal and success criteria for the behavior
- [ ] 3. Sensors: inputs, rates, message types, failure modes
- [ ] 4. Actuators: outputs, limits, command interface
- [ ] 5. Topics/services/actions: the data flow and contracts
- [ ] 6. Control loops: rate, latency budget, state machine
- [ ] 7. Safety constraints: bounds, estop, timeouts, safe defaults
```

## Output format

```markdown
## Goal
...

## Sensors
- /topic (type, rate) -> used for ...; failure handling: ...

## Actuators
- /command (type) -> limits: ...

## Graph (nodes / topics / services)
- nodeA --/topic--> nodeB

## Control loop
- Rate, latency budget, states/transitions

## Safety
- Bounds, estop, timeout behavior, safe default on signal loss
```

Surface safety-critical decisions for explicit confirmation before implementation.
