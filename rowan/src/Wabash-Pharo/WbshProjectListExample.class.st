Class {
	#name : 'WbshProjectListExample',
	#superclass : 'WbshAbstractProjectListExample',
	#category : 'Wabash-Pharo'
}

{ #category : 'accessing' }
WbshProjectListExample >> rootItems [

	^ listService projectNames asArray sort: [ :a :b | a < b ]
]

{ #category : 'accessing' }
WbshProjectListExample >> title [

	^'Project list (client _id: ' , listService _id printString,  ')'
]
