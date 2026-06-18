---
name: robotics-sim-verification
description: Verify robot behaviors with integration tests in simulation (navigation, grasping, locomotion), check real-time constraints, and monitor telemetry. Use after changing control logic, ROS2 nodes, or robot behaviors.
---

# Robotics Simulation Verification

Verify behaviors in simulation before touching hardware.

## Workflow

```
- [ ] 1. Launch the sim (Gazebo/Ignition) with the test world
- [ ] 2. Run integration tests for the behavior (nav / grasp / locomotion)
- [ ] 3. Check real-time constraints (loop rate held, latency budget met)
- [ ] 4. Monitor telemetry for anomalies
- [ ] 5. Verify safety: estop, bounds, timeout behavior trigger correctly
```

## Integration tests
- Use `launch_testing` / `colcon test` to spin up nodes in sim and assert outcomes: goal reached within tolerance, grasp succeeded, gait stable.

```bash
colcon test --packages-select <pkg>
colcon test-result --verbose
```

## Real-time constraints
- Measure achieved control-loop rate and end-to-end latency under load; assert they stay within the declared budget. Flag missed deadlines.

## Telemetry
- Record a bag during the test (`ros2 bag record`) and check key signals (joint limits, command saturation, tracking error) for anomalies.

## Networked robots
- Audit control messages: confirm they reach only intended nodes/hosts, meet latency requirements, and that security/authzn holds for remote commands.

## Safety verification
- Explicitly test that estop, out-of-bounds rejection, and signal-loss timeouts produce the safe default. Do not deploy to hardware until these pass in sim.
