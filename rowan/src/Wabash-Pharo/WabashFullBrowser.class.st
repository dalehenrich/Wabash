Class {
	#name : 'WabashFullBrowser',
	#superclass : 'ClyFullBrowser',
	#classVars : [
		'Connection'
	],
	#category : 'Wabash-Pharo'
}

{ #category : 'accessing' }
WabashFullBrowser class >> connection [

	^ WabashSystemEnvironment rsrConnection
]

{ #category : 'rsr' }
WabashFullBrowser class >> initiateConnection [
	| host port initiator |
	host := '127.0.0.1'.
	port := 47652.
	initiator := RsrInitiateConnection host: host port: port.
	Connection := initiator connect.

]

{ #category : 'opening' }
WabashFullBrowser class >> open [

	<script>
	^ self openOn: WabashNavigationEnvironment currentImage
]

{ #category : 'initialization' }
WabashFullBrowser >> newMethodGroupView [
	"Creates the 'method group' pane (formerly the 'protocol' pane)"

	^ self newNavigationView
		treeStructure: { 
			ClyMethodGroup -> #prepareSubgroupsQueryFrom:in: };
		requestNavigationBy: #methodGroupSelectionChanged;
		neverRestoreSelection
]

{ #category : 'initialization' }
WabashFullBrowser >> newPackageView [
	"Creates the package pane"
	| newPackageView |
	
	newPackageView := self newNavigationView
		treeStructure: 	{ 
			WabashProjectChildItem -> #prepareProjectItemsQueryFrom:in:.
			RPackage -> #prepareClassGroupQueryFrom:in: };
		enableFilterUsing: ClyRegexPattern new;
		requestNavigationBy: #packageSelectionChanged.
	newPackageView filterField announcer 
		when: RubTextChanged 
		send: #updateDefaultPackageFilter 
		to: self.
		
	^ newPackageView
]

{ #category : 'accessing selection' }
WabashFullBrowser >> projectChildrenSelection [
	^packageView selection asSelectedParentsOf: WabashProjectChildItem
]

{ #category : 'accessing' }
WabashFullBrowser >> projectClass [

	^ WabashManagedProject
]

{ #category : 'navigation' }
WabashFullBrowser >> spawnFullBrowser [
	
	^self spawnBrowser: WabashFullBrowser withState: [ :browser | 
		self navigateSpawnedFullBrowser: browser]
]

{ #category : 'private' }
WabashFullBrowser >> specifyClassItemNameOn: nameMorph for: classItem [
	| definition |
	nameMorph contents: classItem name.
	
	definition := classItem systemDefinition.
	
	self packageSelection isMultipleSelected ifTrue: [
		nameMorph contents: (definition printFullNameOf: classItem)].
	(self isPackagePartOfSelection: definition definingPackage) 
		ifFalse: [nameMorph color: self theme classExtensionColor]
]

{ #category : 'private' }
WabashFullBrowser >> specifyMethodItemNameOn: nameMorph for: methodItem [
	| definition |
	nameMorph contents: methodItem name.
	
	definition := methodItem	systemDefinition.
	(self isPackagePartOfSelection: definition definingPackage) ifFalse: [
		nameMorph color: self theme classExtensionColor].
	
	self classSelection isMultipleSelected ifTrue: [
		^nameMorph contents: (definition printFullNameOf: methodItem)].
	
	(self isClassSelected: definition definingClass) ifTrue: [ ^self].
	
	nameMorph emphasis: TextEmphasis italic emphasisCode.
	nameMorph contents: (definition printFullNameOf: methodItem)
]
