<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <title>ИТ продукти</title>

                <link rel="stylesheet" type="text/css" href="IT_style.css" />
            </head>
            <script>
                function showLaptops() {
                document.getElementById('laptopContainer').style.display = 'inline';
        document.getElementById('computerContainer').style.display = 'none';
        document.getElementById('monitorContainer').style.display = 'none';
        document.getElementById('mouseContainer').style.display = 'none';
                }
                function showComputers() {
                document.getElementById('laptopContainer').style.display = 'none';
        document.getElementById('computerContainer').style.display = 'inline';
        document.getElementById('monitorContainer').style.display = 'none';
        document.getElementById('mouseContainer').style.display = 'none';
                };
                function showMonitors() {
                document.getElementById('laptopContainer').style.display = 'none';
        document.getElementById('computerContainer').style.display = 'none';
        document.getElementById('monitorContainer').style.display = 'inline';
        document.getElementById('mouseContainer').style.display = 'none';
                };
                function showMouse() {
                document.getElementById('laptopContainer').style.display = 'none';
        document.getElementById('computerContainer').style.display = 'none';
        document.getElementById('monitorContainer').style.display = 'none';
        document.getElementById('mouseContainer').style.display = 'inline';
                }
            </script>
            <body>
                <h1> ИТ продукти</h1>
                <div class="show_buttons">
                    <button class="button" onclick="showLaptops();">
                        Лаптопи
                    </button>
                    <button class="button" onclick="showComputers()">
                        Компютри
                    </button>
                    <button class="button" onclick="showMonitors()">
                        Монитори
                    </button>
                    <button class="button" onclick="showMouse()">
                        Мишки
                    </button>
                </div>
                <xsl:apply-templates select="/Catalog/ITProducts" />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="/Catalog/ITProducts/Product[@Category='laptop']">
        <div id="laptopContainer" style="display:none;">
            <xsl:for-each select="/Catalog/ITProducts/Product[@Category='laptop']">
                <xsl:sort select="Price" data-type="number" />
                <xsl:sort select="Model" />
                <xsl:variable
                    name="mName"><xsl:value-of select="Maker/@nameRef" /></xsl:variable>
                <xsl:variable
                    name="mId"><xsl:value-of select="Maker/@idRef" /></xsl:variable>
                
                <div
                    class="product">
                    <img src="{unparsed-entity-uri(@productId)}" />

                    <div class="model_info">
                        <p id="product_model">
                            <xsl:for-each
                                select="/Catalog/Makers/Maker[Name=$mName and @makerId=$mId]">
                                <xsl:value-of select="Name" />
                            </xsl:for-each>
        &#160; <xsl:value-of select="Model" />
                        </p>
                    </div>
                    <div class="product_info">
                        <div class="price_info">
                            <p id="label"> Цена: <xsl:value-of select="Price" /> лв. </p>
                        </div>
                        <xsl:if test="Weight">
                            <div class="weight_info">
                                <p id="label"> Тегло: <xsl:value-of select="Weight" /> кг. </p>
                            </div>
                        </xsl:if>
                        <xsl:if test="MemorySize">
                            <div class="memory_info">
                                <p id="label"> Памет: <xsl:value-of select="MemorySize" /> GB </p>
                            </div>
                        </xsl:if>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template match="/Catalog/ITProducts/Product[@Category='computer']">
        <div id="computerContainer" style="display:none;">
            <xsl:for-each select="/Catalog/ITProducts/Product[@Category='computer']">
                <xsl:sort select="Price" data-type="number" />
                <xsl:sort select="Model" />
                <xsl:variable
                    name="mName"><xsl:value-of select="Maker/@nameRef" /></xsl:variable>
                <xsl:variable
                    name="mId"><xsl:value-of select="Maker/@idRef" /></xsl:variable>
                <div
                    class="product">

                    <img src="{unparsed-entity-uri(@productId)}" />


                    <div class="model_info">
                        <p id="product_model">
                            <xsl:for-each
                                select="/Catalog/Makers/Maker[Name=$mName and @makerId=$mId]">
                                <xsl:value-of select="Name" />
                            </xsl:for-each>
        &#160; <xsl:value-of select="Model" />
                        </p>
                    </div>
                    <div class="product_info">
                        <div class="price_info">
                            <p id="label">Цена: <xsl:value-of select="Price" /> лв. </p>
                        </div>
                        <div class="hardDisk_info">
                            <p id="label">Големина на твърд диск: <xsl:value-of
                                    select="HardDisk" /> GB </p>
                        </div>
                        <div class="numUSBPorts_info">
                            <p id="label">Брой USB портове: <xsl:value-of select="NumUSBPorts" />
                            </p>
                        </div>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template match="/Catalog/ITProducts/Product[@Category='monitor']">
        <div id="monitorContainer" style="display:none;">
            <xsl:for-each select="/Catalog/ITProducts/Product[@Category='monitor']">
                <xsl:sort select="Price" data-type="number" />
                <xsl:sort select="Model" />
                <xsl:variable
                    name="mName"><xsl:value-of select="Maker/@nameRef" /></xsl:variable>
                <xsl:variable
                    name="mId"><xsl:value-of select="Maker/@idRef" /></xsl:variable>
                <div
                    class="product">

                    <img src="{unparsed-entity-uri(@productId)}" alt="" />
                    <div class="model_info">
                        <p id="product_model">
                            <xsl:for-each
                                select="/Catalog/Makers/Maker[Name=$mName and @makerId=$mId]">
                                <xsl:value-of select="Name" />
                            </xsl:for-each>
        &#160; <xsl:value-of select="Model" />
                        </p>
                    </div>
                    <div class="product_info">
                        <div class="price_info">
                            <p id="label">Цена: <xsl:value-of select="Price" /> лв. </p>
                        </div>
                        <div class="diagonalSize_info">
                            <p id="label">Диагонален размер: <xsl:value-of
                                    select="DiagonalSize" /> inch </p>
                        </div>
                        <div class="aspectRatio_info">
                            <p id="label">AspectRatio: <xsl:value-of select="AspectRatio" />
                            </p>
                        </div>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template match="/Catalog/ITProducts/Product[@Category='mouse']">
        <div id="mouseContainer" style="display:none;">
            <xsl:for-each select="/Catalog/ITProducts/Product[@Category='mouse']">
                <xsl:sort select="Price" data-type="number" />
                <xsl:sort select="Model" />
                <xsl:variable
                    name="mName"><xsl:value-of select="Maker/@nameRef" /></xsl:variable>
                <xsl:variable
                    name="mId"><xsl:value-of select="Maker/@idRef" /></xsl:variable>
                <div
                    class="product">

                    <img src="{unparsed-entity-uri(@productId)}" alt="" />
                    <div class="model_info">
                        <p id="product_model">
                            <xsl:for-each
                                select="/Catalog/Makers/Maker[Name=$mName and @makerId=$mId]">
                                <xsl:value-of select="Name" />
                            </xsl:for-each>
        &#160; <xsl:value-of select="Model" />
                        </p>
                    </div>
                    <div class="product_info">
                        <div class="price_info">
                            <p id="label">Цена: <xsl:value-of select="Price" /> лв. </p>
                        </div>
                        <div class="buttons_info">
                            <p id="label">Брой на бутоните: <xsl:value-of
                                    select="Buttons" />
                            </p>
                        </div>
                        <div class="movementResolusion_info">
                            <p id="label">MovementResolusion: <xsl:value-of
                                    select="MovementResolusion" /> dpi </p>
                        </div>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
</xsl:stylesheet>