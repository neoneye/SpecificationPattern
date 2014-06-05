swift-specification-pattern
===========================

The **Specification** design pattern implemented in swift.

> In computer programming, the specification pattern is a particular software design pattern, whereby business rules can be recombined by chaining the business rules together using boolean logic.

Source: [wikipedia](http://en.wikipedia.org/wiki/Specification_pattern)



Example of use
--------------

In the following example, we are retrieving invoices and sending them to a collection agency if

1. they are overdue,
2. notices have been sent, and
3. they are not already with the collection agency.

This example is meant to show the end result of how the logic is 'chained' together.

	let overDue = OverDueSpecification()
	let noticeSent = NoticeSentSpecification()
	let inCollection = InCollectionSpecification()
 
	// example of specification pattern logic chaining
	let sendToCollection = overDue.and(noticeSent).and(inCollection.not())
 
	let invoiceCollection = Service.invoices()
	for invoice in invoiceCollection {
	    if sendToCollection.isSatisfiedBy(invoice) {
	        invoice.sendToCollection()
	    }
	}
	


License
-------

Code is under the MIT license.


------

[@neoneye](http://twitter.com/neoneye)
