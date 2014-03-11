# Ruby on Rails Challenge
In order to be considered for the Ruby on Rails position, you must complete the task below. This challenge will demonstrate your abilities with the framework, testing, APIs, and frontend design.

*Note: This task should take no longer than 1-2 hours at most to complete.*

## Description

Your task is to scaffold a Ruby on Rails 4 application that can crawl for and create offers (coupons) from [CJ Affiliate](http://www.cj.com)'s API and display them in a simple view using TDD.

## Tasks

To begin, fork this repository.

### 1. Setup

Fork this repository and create a `source` directory. Within the `source` directory, create a new Rails 4 application. Please use SQLite as the database technology.

### 2. Scaffold Models

The `Offer` model should mimic the JSON data structure below:

```json
{
"id": 9923,
"merchant_id": 2,
"title": "Kaspersky $20 off promo",
"description": "Save $20 on top Kaspersky products",
"url": "http://usa.kaspersky.com/sem/search-aff-4prod-offer",
"expires_at": "2014-02-20 00:00:00 -0800"
}
```

while for the `Merchant` model:

```json
{
"id": 2,
"name": "Kaspersky"
}
```

in which an `Offer` belongs to a `Merchant`. You are free to add any additional attributes that you need.

### 3. Crawl API for Offers

Implement a method within the `Offer` model to crawl for and create offers. The API endpoint and request parameters you will be using is:

```
https://linksearch.api.cj.com/v2/link-search?website-id=5742006&records-per-page=20
```

The documentation for this endpoint can be found [here](http://help.cj.com/en/web_services/link_search_service_rest.htm). **You will be provided with an API key from us**. Use your best judgement to translate the API fields into `Offer` fields. For example, the API field `promotion-end-date` is probably best for `expires_at`. The `Merchant` association should be created from the API fields `advertiser-name` and `advertiser-id`. Also, crawling should be idempotent. That is, crawling the API multiple times should **not** create duplicate offers.

### 4. Build Interface

Build a simple view that can be accessed via `/offers`. Clicking on the "Crawl!" button should crawl and create offers and then display the offers. Please mimic the mockup below:

![Mockup](http://i.imgur.com/Rh2askI.png)

### 5. Write RSpec Tests

**Unit Tests**

1. It should crawl the API and create offers in the database.
2. It should be able to crawl the API multiple times and not create duplicate offers.

**Integration Tests**

3. It should crawl for and create offers when clicking on the button and then display them. Reloading the page should still show the offers.

## Submission

Commit and push code to your forked repository and then send us a pull request with your name in the title. We'll then review your code and get back to you!

