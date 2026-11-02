# Fintech review: decisions

This skill is original to project-design-kraf. It builds on rules already adopted elsewhere in the plugin: confirm or undo destructive actions and never block paste (Vercel Web Interface Guidelines), no fake success states and no invented figures (Hallmark), tabular figures and locale formatting (typography skill).

| # | Topic | Our rule | Why |
|---|---|---|---|
| 1 | Bank- and regulator-specific rules | **Read from the project's `DESIGN.md` → Banking rules. Never invented. Missing rules are reported as "Not checked".** | Rules differ by bank, country and product; a public plugin must not guess them. |
| 2 | Shariah and compliance wording | **Flag for compliance review; never correct it.** | Wrong wording here carries legal and religious weight. |
| 3 | Unknown payment outcome | **Its own state, never shown as success.** | A dropped connection mid-payment is common; a false success causes double payments or missed ones. |
| 4 | Money out vs errors | **Spending uses a sign or label, not the error colour.** | Normal spending isn't a failure; red-for-everything blurs real errors. |
| 5 | Placeholder numbers | **Skeleton blocks only; never `0.00` or `--`.** | A placeholder can be read as a real balance. |
| 6 | Blockers | **Six money-specific blockers added to `ui-review`'s list.** | Each one risks money or trust directly. |
