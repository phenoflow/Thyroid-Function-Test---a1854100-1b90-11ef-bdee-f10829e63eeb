cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  thyroid-function-test-m2-minute---primary:
    run: thyroid-function-test-m2-minute---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  abnormal-thyroid-function-test-m2---primary:
    run: abnormal-thyroid-function-test-m2---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: thyroid-function-test-m2-minute---primary/output
  thyroid-function-test-m2-thyroglobulin---primary:
    run: thyroid-function-test-m2-thyroglobulin---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: abnormal-thyroid-function-test-m2---primary/output
  thyroid-function-test-m2-level---primary:
    run: thyroid-function-test-m2-level---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: thyroid-function-test-m2-thyroglobulin---primary/output
  thyroid-function-test-m2-binding---primary:
    run: thyroid-function-test-m2-binding---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: thyroid-function-test-m2-level---primary/output
  thyroid-function-test-m2-triiodothyronine---primary:
    run: thyroid-function-test-m2-triiodothyronine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: thyroid-function-test-m2-binding---primary/output
  thyroid-function-test-m2-thyroxine---primary:
    run: thyroid-function-test-m2-thyroxine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: thyroid-function-test-m2-triiodothyronine---primary/output
  thyroid-function-test-m2-plasma---primary:
    run: thyroid-function-test-m2-plasma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: thyroid-function-test-m2-thyroxine---primary/output
  thyroid-function-test-m2-uptake---primary:
    run: thyroid-function-test-m2-uptake---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: thyroid-function-test-m2-plasma---primary/output
  thyroid-function-test-m2-hormone---primary:
    run: thyroid-function-test-m2-hormone---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: thyroid-function-test-m2-uptake---primary/output
  thyroid-function-test-m2-serum---primary:
    run: thyroid-function-test-m2-serum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: thyroid-function-test-m2-hormone---primary/output
  total-thyroid-function-test-m2---primary:
    run: total-thyroid-function-test-m2---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: thyroid-function-test-m2-serum---primary/output
  thyroid-function-test-m2---primary:
    run: thyroid-function-test-m2---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: total-thyroid-function-test-m2---primary/output
  function---primary:
    run: function---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: thyroid-function-test-m2---primary/output
  euthyroid-thyroid-function-test-m2---primary:
    run: euthyroid-thyroid-function-test-m2---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: function---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: euthyroid-thyroid-function-test-m2---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
