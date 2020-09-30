({
    render : function (component, helper)
    {
        let svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
        svg.setAttribute( "class", component.get("v.class") );
        svg.setAttribute( "aria-hidden", component.get("v.aria-hidden") );
        svg.innerHTML = '<use xlink:href="' + component.get("v.xlink") + '"></use>';
        return svg;
    }
})