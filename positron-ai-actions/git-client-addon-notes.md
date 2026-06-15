# Git Client Add-on Notes

- In `DITA-addons/add-ons.ditamap`, the Git Client add-on is chunked with `chunk="to-content"`, so all Git Client topics publish as one long page. Write for a continuous reading flow and avoid repeated context.
- Keep only the main `Git Client Add-on` short description. Nested topic short descriptions were removed to avoid repeated italic lead-ins in the rendered page.
- Do not add `related-links` to Git Client child topics because child topic links already appear in the chunked output.
- Preserve `checkout` as one word when it is the Git operation term; do not change it to `check out`.
- Prefer action-oriented topics and document the normal Git workflow clearly: review modified resources, compare changes, stage files, commit, push, pull, and resolve conflicts only when needed.
- Document one primary UI path for each action. Avoid listing all places where the same action appears unless the alternative changes the action scope or supports a distinct workflow.
- Refer to the vertical three-dot menu as the `Ellipsis` menu in the `Git Staging` view toolbar. Do not call it a settings icon.
- The Git Client add-on uses comparison and merge tools provided by Oxygen XML. Do not describe those tools as built into the Git Client add-on itself.
- In Git Client action reference topics, avoid definition lists for individual action entries because they create sparse published output. Use a compact pattern, such as concise labeled paragraphs, and give enough detail to explain what the action does, related Git concepts, scope, result, availability, and when to use it.
- In Git Client action reference topics, when an action is accessible from more than one place, format the `Accessible From` information as a compact list instead of a long inline sentence.
- In Git Client action reference topics, link `Accessible From` entries to the relevant interface topic or linkable section when such a target exists, such as the Git menu topic, Git Staging view toolbar, Ellipsis menu, file areas, commit area, Git Branch Manager, Git History view sections, Project view, DITA Maps Manager, or preferences topic.
