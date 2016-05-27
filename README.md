| [Solution](https://github.com/SimonGlancy/Alliants_tech_test#solution) | [Conclusion](https://github.com/SimonGlancy/Alliants_tech_test#conclusion) |

# Alliants - Tech Test

#### Author: Simon Glancy
#### Date: 27/05/2016

This is a response to the following tech test:

### Challenge

Our client is an online marketplace, here is a sample of some of the products available on our site:

| Product code | Name | Price |
|---|---|---|
| 001 | Lavender heart | £9.25 |
| 002 | Personalised cufflinks | £45.00 |
| 003 | Kids T-shirt | £19.95 |

Our marketing team want to offer promotions as an incentive for our customers to purchase these items.

* If you spend over £60, then you get 10% off your purchase

* If you buy 2 or more travel card holders then the price drops to £8.50.

Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.

---------------
### Code Requirements

The interface to our checkout looks like this (shown in Ruby):
```
co = Checkout.new(promotional_rules)

co.scan(item)

co.scan(item)

price = co.total

Implement a checkout system that fulfills these requirements.

```
----------

### Test Data
|No. | Basket | Total price expected |
|---|---|---|
| 1 | 001,002,003 | £66.78 |
| 2 | 001,003,001 | £36.95 |
| 3 | 001,002,001,003 | £73.76 |

---------

### Solution

I attempted to complete this task in the most object oriented manner possible, my final solution has four seperate classes attempting to adhere to SOLID principles as much as possible.

I saw one of the promotions as being local and one being global and have therefore implemented them at different stages of checkout process as described below.

##### Classes

Item - This is an object has all of the data shown and includes a discount method which allows the object to change it's price if required (through the promotion).

Basket - This is an object which can store item objects and gives the total cost of all items within it.

MultibuyDiscount - This an object that is passed the basket and checks whether the basket contains any multibuy objects and applies the discount as appropriate.

BasketDiscount - This an object that is passed the basket and checks whether the basket total is greater than the relevant threshold and applies the relevant discount.

PromotionRules - This is a wrapper that takes a hash of different promotion objects. These are stored in the multibuy_discounts array or the basket_discounts array. The intention in this was to allow for multiple discounts to be added. The relevant apply method iterate through these arrays passing the basket object as an argument and calls the individual discount objects' apply methods.

Checkout - This is the controller that is initialized with a new basket object and is passed a PromotionRules object. The scan method adds items to the basket object and total calls the PromotionRules object to apply the relevant discounts. It is programmed to work even when a PromotionRules object is not passed to it.

##### Testing

The solution is fully tested using RSpec and a feature test of the 3 pieces of test data is included. I have used dependency injection to adhere to single responsibility principle and have therefore been able to double all external classes in my tests. I added a fourth test to test a second basket discount if you spend over £100.

###### Conclusions

I am happy with this solution as I have not used researched and tried to replicate a known checkout/promotions design pattern.

This is an improvement on the same [test](https://github.com/SimonGlancy/NOTHS_tech_test#solution) I completed the day before. By creating the discount objects I think I have made a fairly optimal OO design. It removed the slightly hacky guard clauses I had to implement.

I have thought about future expansion in how the PromotionRules object works although not required for this question I think it proves that the design is extendable.
