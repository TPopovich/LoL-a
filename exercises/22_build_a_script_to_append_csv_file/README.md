## lets build a util to prompt for a caseId and a region

We will prompt for a caseId.

We will prompt for a azure `region`.

Assume you have a `~/bin` folder as you should always have one...

We want the script to append a line to a file that is `~/bin/cases.csv`
and create the `~/bin/` folder if needed.

E.g. given caseId=41fc-b258-5f91a1f4ce44
E.g. given region=centraluseuap

append this line:

```
caseId=41fc-b258-5f91a1f4ce44,centraluseuap
```
