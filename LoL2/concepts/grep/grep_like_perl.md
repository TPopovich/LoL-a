# grep regex style changes with flags, -E vs -P

| Flag | Purpose | Example |
| :--- | :--- | :--- |
| **`-e`** | Specifies a pattern string (great for patterns starting with `-` or multiple patterns) | `grep -e "-test" -e "error" file.txt` |
| **`-E`** | Enables Extended Regex (cleaner `\|`, `+`, `?`, `{}`) | `grep -E "cat\|dog" file.txt` |
| **`-P`** | Enables PCRE Regex (adds `\d`, `\s`, lookarounds, non-greedy matching) | `grep -P "(?<=id=)\d+" file.txt` |
