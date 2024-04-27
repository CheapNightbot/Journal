# Scripts ~ (￣_￣|||) Yes, me lazy! 

This directory contains some (poorly written) **Bash Scripts** to make me even 'lazier'.

## But why?

The `date` pattern (that's what it called, right?) is kinda pain for me and I don't get it right, right away. It's just waste of time (for me) to try to figure out the date-time, etc. and write in the following pattern: `2024-04-01T12:30:00`. It's overwhelming and of course, me lazy..

Other thing is, like, the template/starting point of each, whether blog or journal is the same (for me). So, instead of copy-pasting manually and changing things, for example title or date, I can't..

## What does these scripts do?

### `blog-startup.sh`

Ask for the Blog Title and create a <u>directory</u> OR a <u>markdown</u> file with the following name pattern:

- `yyyy-mm-dd-title[.md]`.
- For example, `2024-04-02-this-is-the-test-post.md` or a directory with the same name based upon what you choose.
- The *basic* frontmatter also added.

### `journal-startup.sh`

Add a new entry (at the top) in the `journal.md` with the pre-defined format:

> The `$date_short` & `$date_full` will be replaced with actual date and time. Though the `{{ date_format... }}` thing is the **Zola** shortcode to render the date-time in custom format.

```markdown
## {{ date_format(date="$date_short") }} :EMOJI:
> {{ date_format_journal(date="$date_full") }}

- 
```

## License

Any content within the '**scripts**' directory *only*, unless specified otherwise, is provided under the **MIT License**."

Please check [LICENSE](LICENSE) for more information.
