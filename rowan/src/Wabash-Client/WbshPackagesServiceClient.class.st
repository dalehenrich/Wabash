Class {
	#name : 'WbshPackagesServiceClient',
	#superclass : 'WbshPackagesService',
	#category : 'Wabash-Client'
}

{ #category : 'acessing' }
WbshPackagesServiceClient >> packageNames [
	^remoteSelf packageNames wait
]
