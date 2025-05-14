xquery version "3.0";

declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace output="http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "html";
declare option output:html-version "5.0";
declare option output:media-type "text/html";

let $collection := collection("/db/apps/C7S-data/data")

let $tagNames :=
for $doc in $collection
return distinct-values($doc/tei:TEI//tei:text//*/name())

let $elements :=
    for $doc in $collection
    for $el in $doc//tei:text//*
    
        let $all :=
        <element-info>
        <file>{base-uri($doc)}</file>
        <name>{name($el)}</name>
        <attributes> {
            for $attr in ($el/@*)
            return <attribute name="{name($attr)}" value="{$attr}" />}
        </attributes>
        </element-info>
        return $all


(:    for $tag in $tagNames:)
(:    return:)
(:    <tag-info>:)
(:    <name>{$tag}</name>:)
(:    <attributes>:)
(:    {$elements/attribute}:)
(:    </attributes>:)
(:    </tag-info>:)
let $grouped := 
  for $name in distinct-values($elements/name)
  order by $name
  let $matching := $elements[name = $name]
  let $attrs := distinct-values($matching/attributes/attribute/@name)
  return
    <tag name="{$name}">
      {
        for $a in $attrs
        order by $a
        return <attribute name="{$a}"/>
      }
    </tag>

return 
    <ol>{
        
    for $tag in $grouped

    return
        <li>{$tag/@name/string()}
            <ul>
                {for $a in $tag/attribute 
                return 
                    <li>@{$a/@name/string()}
                        {
                            (:     TODO: add listing of unique names for this attribute, except for xml:id, n, key and ref               :)
                            (:        [not(name() = ("xml:id", "n", "key", "ref"))]:)
                        }
                    </li>
                }
            </ul>
        </li>
    }
    </ol>
        

