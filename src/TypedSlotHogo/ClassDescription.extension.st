Extension { #name : #ClassDescription }

{ #category : #'*TypedSlotHogo' }
ClassDescription >> createType [
	^ SingleType new type: self; yourself
		
]
