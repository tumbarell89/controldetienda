<div class="space-y-6">
    
    <div>
        <x-input-label for="factura" :value="__('Factura')"/>
        <x-text-input id="factura" name="factura" type="text" class="mt-1 block w-full" :value="old('factura', $dsalidaalmacen?->factura)" autocomplete="factura" placeholder="Factura"/>
        <x-input-error class="mt-2" :messages="$errors->get('factura')"/>
    </div>
    <div>
        <x-input-label for="precioventa" :value="__('Precioventa')"/>
        <x-text-input id="precioventa" name="precioventa" type="text" class="mt-1 block w-full" :value="old('precioventa', $dsalidaalmacen?->precioventa)" autocomplete="precioventa" placeholder="Precioventa"/>
        <x-input-error class="mt-2" :messages="$errors->get('precioventa')"/>
    </div>
    <div>
        <x-input-label for="total" :value="__('Total')"/>
        <x-text-input id="total" name="total" type="text" class="mt-1 block w-full" :value="old('total', $dsalidaalmacen?->total)" autocomplete="total" placeholder="Total"/>
        <x-input-error class="mt-2" :messages="$errors->get('total')"/>
    </div>
    <div>
        <x-input-label for="esventa" :value="__('Esventa')"/>
        <x-text-input id="esventa" name="esventa" type="text" class="mt-1 block w-full" :value="old('esventa', $dsalidaalmacen?->esventa)" autocomplete="esventa" placeholder="Esventa"/>
        <x-input-error class="mt-2" :messages="$errors->get('esventa')"/>
    </div>
    <div>
        <x-input-label for="nalmacenes_origen_id" :value="__('Nalmacenes Origen Id')"/>
        <x-text-input id="nalmacenes_origen_id" name="nalmacenes_origen_id" type="text" class="mt-1 block w-full" :value="old('nalmacenes_origen_id', $dsalidaalmacen?->nalmacenes_origen_id)" autocomplete="nalmacenes_origen_id" placeholder="Nalmacenes Origen Id"/>
        <x-input-error class="mt-2" :messages="$errors->get('nalmacenes_origen_id')"/>
    </div>
    <div>
        <x-input-label for="nalmacenes_destino_id" :value="__('Nalmacenes Destino Id')"/>
        <x-text-input id="nalmacenes_destino_id" name="nalmacenes_destino_id" type="text" class="mt-1 block w-full" :value="old('nalmacenes_destino_id', $dsalidaalmacen?->nalmacenes_destino_id)" autocomplete="nalmacenes_destino_id" placeholder="Nalmacenes Destino Id"/>
        <x-input-error class="mt-2" :messages="$errors->get('nalmacenes_destino_id')"/>
    </div>
    <div>
        <x-input-label for="dproveedor_destino_id" :value="__('Dproveedor Destino Id')"/>
        <x-text-input id="dproveedor_destino_id" name="dproveedor_destino_id" type="text" class="mt-1 block w-full" :value="old('dproveedor_destino_id', $dsalidaalmacen?->dproveedor_destino_id)" autocomplete="dproveedor_destino_id" placeholder="Dproveedor Destino Id"/>
        <x-input-error class="mt-2" :messages="$errors->get('dproveedor_destino_id')"/>
    </div>

    <div class="flex items-center gap-4">
        <x-primary-button>Submit</x-primary-button>
    </div>
</div>