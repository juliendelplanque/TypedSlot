Extension { #name : #ClassDescription }

{ #category : #'*TypedSlotHogo' }
ClassDescription >> asConstraint [
	^ SingleType new type: self; yourself
		
]
