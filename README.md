# [Capstone Project] Sentry Manager

One of the problems that a large engineering team that supports a large user base is the amount of developer logging that occurs. At my company, 11 million developer logs are processed every week. While these logs are helpful in aiding the detection of bugs and incidents, they also tend to be extremely noisy and tedious.

Over time, we've made a few observations:

* Due to sheer volume of logs, not all logs get engineering attention
* Due to the limited engineering bandwidth, a technical project manager is assigned to manually look into top issues every week and ensure they have owners

At my company, we use a platform called [Sentry](www.sentry.io) to store and analyze our developer logs. 
