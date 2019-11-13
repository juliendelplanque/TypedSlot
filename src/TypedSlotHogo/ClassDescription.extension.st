Extension { #name : #ClassDescription }

{ #category : #'*TypedSlotHogo' }
ClassDescription >> asTypeConstraint [
	^ SingleType new type: self; yourself
		
]
