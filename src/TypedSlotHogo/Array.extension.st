Extension { #name : #Array }

{ #category : #'*TypedSlotHogo' }
Array >> asInterfaceConstraint [
	^ AnonymousInterfaceConstraint selectors: self 
]

{ #category : #'*TypedSlotHogo' }
Array >> asTypeConstraint [
	self size = 1 ifTrue: [ ^ self anyOne asTypeConstraint ].
	^ MultipleType new types: (self collect: [:aType| aType asTypeConstraint ]) ; yourself
]
