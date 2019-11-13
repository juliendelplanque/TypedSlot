Extension { #name : #Array }

{ #category : #'*TypedSlotHogo' }
Array >> asInterfaceConstraint [
	^ AnonymousInterfaceType selectors: self 
]

{ #category : #'*TypedSlotHogo' }
Array >> asTypeConstraint [
	^ MultipleType new types: (self collect: [:aType| aType asTypeConstraint ]) ; yourself
]
