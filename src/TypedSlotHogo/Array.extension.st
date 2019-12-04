Extension { #name : #Array }

{ #category : #'*TypedSlotHogo' }
Array >> asConstraint [
	self ifEmpty: [ ^ EmptyType new ].
	self size = 1 ifTrue: [ ^ self anyOne asConstraint ].
	^ MultipleType new types: (self collect: [:aType| aType asConstraint ]) ; yourself
]

{ #category : #'*TypedSlotHogo' }
Array >> asInterfaceConstraint [
	^ AnonymousInterfaceConstraint selectors: self 
]
