visiting-codeblock
visitCodeblockMethodDefinition: aCodeBlock
	"Creates an instance of PRBookTestResult with parameters depending of the type of the codeblock. 
	Here it is for a test definition and therefore uses the specialized test definition methods
	textForMethodDefinition
	executeAndReportMethodDefinition:"
	| result |
	
	self withPillarAuthorDo: [
		result := PRBookTestResult new.
		result text: aCodeBlock text.
		result fragmentedText: aCodeBlock textForMethodDefinition.
		allTestResults add: result.
		self executeAndReportMethodDefinition: result.
		(aCodeBlock isExpectedFailure)
			ifTrue: [ result status: (result status) not] ]