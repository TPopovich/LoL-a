(setq *template-spec* "
        [TestMethod]
        public async Task CallScenarioRunnerUnifiedSpecExample()
        {
            await InvokeUnifiedSpecFile(specFilename: \"ValidateVectorSearchIVFnProbes.json\");
        }
")

(setq *template-spec* "
        [TestMethod]
        public async Task CallScenarioRunner%s()
        {
            await InvokeUnifiedSpecFile(specFilename: \"%s.json\");
        }
")

(format *template-spec* "aa"  "aa")

      (loop for filename in (split-string "
BulkInsertTest
CreateUniqueIndexConflict
DropIndex
ValidateCompoundIndex
ValidateFacet
ValidateSortByCountFailsWithDocumentLiteral
ValidateSortByCountSharded
ValidateSortByCountSimple
ValidateSortByCountUnwind
ValidateSortByCountUnwindAsync_csharp
ValidateUnCorrelatedLookupPipeline_combined
ValidateVectorSearch
ValidateVectorSearchEmptyVector
ValidateVectorSearchIVFnProbes
ValidateVectorSearchScore
" nil t)
            do (progn
		 (princ (format *template-spec* filename filename))))

