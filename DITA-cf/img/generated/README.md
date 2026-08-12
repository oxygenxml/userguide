# Generated screenshots — do not edit

Every PNG in this folder is produced automatically from a Storybook story in the Content Fusion
frontend. Editing or replacing one by hand will be silently overwritten the next time the guide's
screenshots are refreshed.

## Refreshing them after a UI change

From `webreviewer-frontend/www/ui` in the `fusion` repository:

```bash
npm run docs-screenshots -- --copy-to <path-to>/userguide-private/DITA-cf/img/generated
```

That builds a static Storybook, captures every figure, and replaces this whole folder. Then review
and commit the result here. Nothing else in the guide needs touching — each story declares the exact
file name it produces, so the `<image href="../img/generated/…"/>` references stay valid.

## Adding or changing a figure

The stories live in `webreviewer-frontend/www/ui/src/app/storybook/docs-screenshots/`, and the
standard operating procedure — including how to mock data, what the capture limits are, and the
pitfalls — is in that folder's `README.md`.

A new figure needs one DITA edit: point the topic's `<image href>` at `../img/generated/<name>.png`.

## What is *not* here

Images that no story can produce stay in the parent `img/` folder and are still maintained by hand:
icons and inline glyphs, screenshots of the embedded Oxygen XML Web Author editor, hand-drawn
diagrams, and third-party UI such as the AWS Management Console.

## One coupling to be careful about

`topics/user_interface.dita` wraps `fusion-ui.png` in a DITA `<imagemap>` whose `<coords>` are
hard-coded pixel rectangles over the four UI regions. They match the current 1180x660 image. If that
story's layout changes the image's size, the coordinates must be recomputed.
