Class {
	#name : 'WabashProjectServiceClient',
	#superclass : 'WabashProjectService',
	#category : 'Wabash-Client'
}

{ #category : 'accessing' }
WabashProjectServiceClient >> packageNames [
	^ remoteSelf packageNames wait
]
