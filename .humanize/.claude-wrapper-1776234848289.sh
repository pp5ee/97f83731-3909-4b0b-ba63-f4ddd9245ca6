#!/bin/sh
cd '/app/workspaces/97f83731-3909-4b0b-ba63-f4ddd9245ca6' || exit 1
exec 'claude' '--dangerously-skip-permissions' '--print' '/humanize:gen-plan --input requirements/draft.md --output docs/plan.md --direct'
