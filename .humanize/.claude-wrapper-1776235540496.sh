#!/bin/sh
cd '/app/workspaces/97f83731-3909-4b0b-ba63-f4ddd9245ca6' || exit 1
exec 'claude' '--dangerously-skip-permissions' '--print' '/humanize:start-rlcr-loop docs/plan.md --max 3 --yolo --codex-model minimax-m2.5:high --full-review-round 5 --track-plan-file --agent-teams --push-every-round'
