# [Capstone Project] Sentry Manager

One of the problems that a large engineering team that supports a large user base is the amount of developer logging that occurs. At my company, 11 million developer logs are processed every week. While these logs are helpful in aiding the detection of bugs and incidents, they also tend to be extremely noisy and tedious.

Over time, we've made a few observations:

* Due to sheer volume of logs, not all logs get engineering attention
* Due to the limited engineering bandwidth, a technical project manager (TPM) is assigned to manually look into top issues every week and ensure they have owners

At my company, we use a platform called [Sentry](https://www.sentry.io) to store and analyze our developer logs. The goal of the capstone project is to build an AI agent to take over the role of the TPM to free him to focus on other things.

## Agent Design

The agent for the capstone project is fairly straightforward:

<img width="546" alt="Screenshot 2025-03-11 at 11 01 40 PM" src="https://github.com/user-attachments/assets/b67bde11-c205-479e-8658-09992418e2ac" />

Here is an explanation of each step in the state graph:

1. We fetch the issues from Sentry and ask OpenAI to simplify the response into something more easily digestible.
2. Once again using OpenAI, we identify the highest priority issue that a frontend engineer should be assigned to fix. (This can be later extended to include backend owners)
3. Using the highest priority issue from the previous step, we create a data model that represents a simple Jira ticket.
4. With the Jira ticket, we make a POST request to Trello to create a new Card. (Assignee is set to `kelvin` for simplicity)
5. Finally, the last step summarizes all the actions taken by the agent to give a report for a human to read.

> **Note**: Every step that includes a network operation (fetching from Sentry, using OpenAI, posting to Trello) has a conditional edge that can fail if the network operations fail.

## Implementation Details


