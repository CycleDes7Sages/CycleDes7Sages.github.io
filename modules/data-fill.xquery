xquery version "3.0";

declare namespace tei = "http://www.tei-c.org/ns/1.0";


(: Hierarchical structure of subfolders :)
declare function local:create-path($file-path as xs:string, $base-path as xs:string, $target-path as xs:string, $content) {
    let $relative-path := substring-after($file-path, $base-path)
    let $segments := tokenize(substring($relative-path, 2), "/") 
    return

    for $i in 1 to count($segments) - 1
        let $current := $target-path || "/" || string-join(subsequence($segments, 1, $i), "/")
        return (
          if (xmldb:collection-available($current)) then ()
          else xmldb:create-collection($target-path || "/" || string-join(subsequence($segments, 1, $i - 1), "/"), $segments[$i]),
          if ($i = count($segments) - 1) then  
              xmldb:store($current, $segments[$i +1], $content)
              else ()
        )
};

(: Passing nodes to update div and p ids :)
declare function local:update-div-ids($doc as document-node()) as document-node() {
  document {
    element { node-name($doc/*) } {
      $doc/*/@*,
      for $node in $doc/*/node()
      return local:process-node($node)
    }
  }
};

(: Updating p and div xml:ids in single node :)
declare function local:process-node($node as node()) as node() {
  typeswitch ($node)
    case element(tei:div) return
      let $head := $node/tei:head
      let $id := if ($head/@n) then $head/@n else ()
      return
        element { node-name($node) } {
          $node/@* except $node/@xml:id,
          if ($id) then attribute xml:id { $id } else (),
          for $child in $node/node()
          return local:process-node($child)
        }
    case element(tei:p) return
      let $id := $node/@n
      return
        element { node-name($node) } {
          $node/@* except $node/@xml:id,
          if ($id) then attribute xml:id { $id } else (),
          $node/node()
        }
    case element() return
      element { node-name($node) } {
        $node/@*,
        for $child in $node/node()
        return local:process-node($child)
      }
    default return $node
};
    

declare function local:find-duplicate-xml-ids($collection-path as xs:string) as element()* {
  let $docs := collection($collection-path)
  let $id-file-pairs := for $doc in $docs
    let $uri := document-uri($doc)
    for $id in $doc//@xml:id
    return
      <id-file>
        <id>{string($id)}</id>
        <file>{string($uri)}</file>
      </id-file>
  let $grouped := 
    for $id in distinct-values($id-file-pairs/id)
    let $files := $id-file-pairs[id = $id]/file
    where count($files) > 1
    return
      <duplicate-id value="{$id}" count="{count($files)}">
        {
          for $file in distinct-values($files)
          return <file>{$file}</file>
        }
      </duplicate-id>
  return $grouped
};


let $collection-path := "/db/apps/C7S-data"
let $source-path := "data"
let $target-path := "data-converted"
let $collection := collection($collection-path || "/" || $source-path)


let $root := if (xmldb:collection-available($target-path)) then ()
      else xmldb:create-collection($collection-path, $target-path)

return
    (
    for $doc in $collection
    let $new-document := local:update-div-ids($doc)
    return 
        local:create-path(document-uri($doc), $collection-path || "/" || $source-path, $collection-path || "/" || $target-path, $new-document),
        local:find-duplicate-xml-ids($collection-path || "/" || $target-path)
    )      


